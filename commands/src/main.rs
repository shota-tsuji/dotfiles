use anyhow::{Context, Result};
use std::{env, fs};
use std::fs::File;
use std::io::{BufRead, BufReader, Cursor, Write};
use std::path::PathBuf;
use std::process::Command;
extern crate skim;
use skim::prelude::*;

pub fn open_repository() -> Result<()> {
    let jetbrains_scripts = format!(
        "{}/Library/Application Support/JetBrains/Toolbox/scripts",
        std::env::var("HOME").context("Failed to get HOME env var")?
    );
    let editor_choices = list_files_in_dir(&jetbrains_scripts);

    let options = build_options();

    let editor = select_item(&options, editor_choices).context("No editor selected")?;

    let (ghq_root, repository_choices) = get_ghq_repos();
    let repository = select_item(&options, repository_choices).context("No repository selected")?;

    let repository_path = format!("{}/{}", ghq_root, repository);
    println!("{} {}", editor, repository_path);

    Ok(())
}

pub fn move_to_repository() -> Result<String> {
    let (ghq_root, repository_choices) = get_ghq_repos();
    let options = build_options();
    let repository = select_item(&options, repository_choices).context("No repository selected")?;
    Ok(format!("{}/{}", ghq_root, repository))
}

fn get_ghq_repos() -> (String, Vec<String>) {
    // Get ghq root
    let ghq_root = Command::new("ghq")
        .arg("root")
        .output()
        .expect("Failed to run ghq root");
    let ghq_root = String::from_utf8_lossy(&ghq_root.stdout).trim().to_string();

    // Get full paths
    let repos = Command::new("ghq")
        .args(["list", "--full-path"])
        .output()
        .expect("Failed to run ghq list --full-path");
    let repos = String::from_utf8_lossy(&repos.stdout);

    // Remove ghq_root prefix to get relative paths
    let repositories = repos
        .lines()
        .filter_map(|line| line.strip_prefix(&format!("{}/", ghq_root)))
        .map(|s| s.to_string())
        .collect();

    (ghq_root, repositories)
}

fn build_options() -> SkimOptions {
    // To avoid overwriting the terminal content after selection, height and min_height are not set.
    SkimOptionsBuilder::default()
        .exact(true)
        .no_sort(true)
        .prompt(String::from("query> "))
        .build()
        .unwrap()
}

fn select_item(options: &SkimOptions, items: Vec<String>) -> Result<String> {
    let item_reader = SkimItemReader::default();
    let items_str = items.join("\n");
    let skim_items = item_reader.of_bufread(Cursor::new(items_str));
    let Some(result) = Skim::run_with(options, Some(skim_items)) else {
        return Err(anyhow::anyhow!("No item selected"));
    };
    if result.is_abort {
        return Err(anyhow::anyhow!("Selection aborted"));
    }
    let selected = result.selected_items
        .first()
        .cloned()
        .ok_or_else(|| anyhow::anyhow!("No item selected"))?;
    Ok(selected.text().to_string())
}

fn list_files_in_dir(dir_path: &str) -> Vec<String> {
    match fs::read_dir(dir_path) {
        Ok(entries) => entries
            .filter_map(|entry| entry.ok().map(|e| e.file_name().into_string().unwrap()))
            .collect(),
        Err(_) => Vec::new(),
    }
}

fn extract_operation() -> Result<()> {
    let ops_dir = format!("{}/ops", std::env::var("HOME")?);
    let mut operations = Vec::new();

    // Collect all lines from all files in ~/ops/
    let Ok(entries) = fs::read_dir(&ops_dir) else {
        return Err(anyhow::anyhow!("Ops directory not found: {}", ops_dir));
    };

    let files: Vec<PathBuf> = entries
        .flatten()
        .map(|entry| entry.path())
        .filter(|entry| entry.is_file())
        .collect();
    let contents_list: Vec<String> = files
        .iter()
        .filter_map(|path| fs::read_to_string(path).ok())
        .collect();
    for content in contents_list {
        for line in content.lines() {
            operations.push(line.to_string());
        }
    }

    let options = build_options();

    let operation = select_item(&options, operations).context("No operation selected")?;
    print!("{}", operation);
    Ok(())
}

fn select_cdr_directory() -> Result<i32> {
    let cache_path = format!("{}/.cache/chpwd-recent-dirs", std::env::var("HOME")?);
    let file = File::open(&cache_path).context("Failed to open chpwd-recent-dirs")?;
    let reader = BufReader::new(file);

    // Regex to match lines like $'/path/to/directory'
    // Capture the group (occurrence of .*)
    let re = Regex::new(r"^\$'(.*)'$")?;

    fn extract_dir(line: &str, re: &Regex) -> Option<String> {
        // get the first capture group
        re.captures(line)
            .and_then(|caps| caps.get(1).map(|m| m.as_str().to_string()))
    }

    let current_dir = env::current_dir()?.to_str().unwrap().to_string();

    let dirs: Vec<String> = reader
        .lines()
        .map_while(Result::ok)
        .filter_map(|line| extract_dir(&line, &re))
        .filter(|dir| dir != &current_dir)
        .collect();
    let options = build_options();
    let directory = select_item(&options, dirs).context("No directory selected")?;

    print!("{}", directory.text().to_string());
    std::io::stdout().flush().context("Failed to flush stdout")?;
    Ok(0)
}

use clap::{Parser, Subcommand};
use regex::Regex;

#[derive(Parser)]
#[command(name = "commands")]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    OpenRepository,
    Ops,
    MoveToRepository,
    Cdr,
}

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Commands::OpenRepository => {
            if let Err(e) = open_repository() {
                eprintln!("Error: {}", e);
            }
        }
        Commands::Ops => {
            if let Err(e) = extract_operation() {
                eprintln!("Error: {}", e);
            }
        }
        Commands::MoveToRepository => match move_to_repository() {
            Ok(repository) => print!("{}", repository),
            Err(e) => eprintln!("Error: {}", e),
        },
        Commands::Cdr => match select_cdr_directory() {
            Ok(exit_code) => std::process::exit(exit_code),
            Err(_) => std::process::exit(1),
        }
    }
}
