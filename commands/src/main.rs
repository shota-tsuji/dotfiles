use std::fs;
use std::io::Cursor;

extern crate skim;
use skim::prelude::*;


pub fn main() {
        let jetbrains_scripts = format!(
            "{}/Library/Application Support/JetBrains/Toolbox/scripts",
            std::env::var("HOME").unwrap()
        );
    let editors = list_files_in_dir(&jetbrains_scripts);

    let options = build_options();

    let selected_editor = select_item(&options, editors);
    let Ok(selected_item) = selected_editor else {
        println!("No editor selected.");
        return;
    };

    let (ghq_root, repos) = get_ghq_repos();
    let selected_repository = select_item(&options, repos);
    let Ok(selected_repository) = selected_repository else {
        println!("No repository selected.");
        return;
    };

    let repository_path = format!("{}/{}", ghq_root, selected_repository.text());

    println!("{} {}", selected_item.text(), repository_path);
}


use std::process::Command;

fn get_ghq_repos() -> (String, Vec<String>) {
    // Get ghq root
    let ghq_root = Command::new("ghq")
        .arg("root")
        .output()
        .expect("Failed to run ghq root");
    let ghq_root = String::from_utf8_lossy(&ghq_root.stdout).trim().to_string();

    // Get full paths
    let repos = Command::new("ghq")
        .args(&["list", "--full-path"])
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
    SkimOptionsBuilder::default()
        .exact(true)
        .no_sort(true)
        .min_height(String::from("3%"))
        .build()
        .unwrap()
}

fn select_item(
    options: &SkimOptions,
    items: Vec<String>,
) -> Result<String, Box<dyn std::error::Error>> {
    let item_reader = SkimItemReader::default();
    let items_str = items.join("\n");
    let skim_items = item_reader.of_bufread(Cursor::new(items_str));
    let selected = Skim::run_with(&options, Some(skim_items))
        .map(|out| out.selected_items)
        .and_then(|out| out.get(0).cloned())
        .ok_or("No item selected")?;
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
