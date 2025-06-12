# Learny

## Overview
Learny is a Ruby-based agent that uses AI to interact with your codebase. It can read files, list directories, edit files, and more.

## Features

- Interactive chat interface with an AI agent
- File operations:
  - Read files (`read_file`)
  - List files and directories (`list_files`)
  - Edit text files (`edit_file`)
  - Execute shell commands (`run_shell_command`)
  - Create vector embeddings (`create_embeddings`)
  - Create embeddings from file contents (`embed_file`)

## Prerequisites

- Ruby (recommended version 2.7+)
- Bundler
- Anthropic API key

## Installation
1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd learny
   ```

2. Install dependencies:
   ```sh
   bundle install
   ```

3. Set up your environment:
   - Ensure you have `asdf` installed and configured.
   - Set the `ANTHROPIC_API_KEY` environment variable.

## Usage
### Running Learny
To run Learny, use the `learny` script located in the `bin` directory. This script can be placed in a directory that is part of your `PATH` for easy access.

```sh
# Example: Place the script in a directory in your PATH
cp bin/learny ~/bin/

# Run Learny from any directory
learny
```

### Debug Mode
You can run Learny in debug mode to see additional output:

```sh
learny --debug
```

### Example Commands
- List files in the current directory:
  ```
  > Give me a list of the files in this directory
  ```

- Read a file:
  ```
  > Read the contents of <file-path>
  ```

- Edit a file:
  ```
  > Edit <file-path> to replace <old-text> with <new-text>
  ```

## Project Structure

- `learny.rb` - Main entry point
- `Gemfile` - Ruby dependencies
- `src/agent.rb` - Agent implementation
- `src/tools/` - Tool implementations:
  - `read_file.rb` - Tool to read file contents
  - `list_files.rb` - Tool to list files and directories
  - `edit_file.rb` - Tool to edit text files
  - `run_shell_command.rb` - Tool to execute shell commands
  - `create_embeddings.rb` - Tool to create vector embeddings
  - `embed_file.rb` - Tool to create embeddings from file contents

## Dependencies

- [ruby_llm](https://github.com/ruby-llm/ruby-llm) - Ruby client for LLM APIs

## Environment Variables

- `ANTHROPIC_API_KEY` - Your Anthropic API key for accessing Claude models

## Troubleshooting

- If you encounter an authentication error, make sure your `ANTHROPIC_API_KEY` is set correctly
- Ensure all dependencies are installed with `bundle install`

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
