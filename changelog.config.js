module.exports = {
  disableEmoji: false,
  format: "{type}: {subject}",
  list: [
    "fix",
    "feat",
    "refactor",
    "test",
    "style",
    "chore",
    "docs",
    "perf",
    "ci",
  ],
  maxMessageLength: 64,
  minMessageLength: 3,
  questions: ["type", "subject"],
  scopes: [],
  types: {
    chore: {
      description: 'Build process or auxiliary tool changes',
      value: 'chore'
    },
    ci: {
      description: 'CI related changes',
      value: 'ci'
    },
    docs: {
      description: 'Documentation only changes',
      value: 'docs'
    },
    feat: {
      description: 'A new feature',
      value: 'feat'
    },
    fix: {
      description: 'A bug fix',
      value: 'fix'
    },
    perf: {
      description: 'A code change that improves performance',
      value: 'perf'
    },
    refactor: {
      description: 'A code change that neither fixes a bug or adds a feature',
      value: 'refactor'
    },
    release: {
      description: 'Create a release commit',
      value: 'release'
    },
    style: {
      description: 'Markup, white-space, formatting, missing semi-colons...',
      value: 'style'
    },
    test: {
      description: 'Adding missing tests',
      value: 'test'
    },
  },
};
