# Learny - An AI Agent Tool

Learny is a simple Ruby-based AI agent that provides file manipulation capabilities through a conversational interface powered by Claude AI.

## Features

- Interactive chat interface with an AI agent
- File operations:
  - Read files (`read_file`)
  - List files and directories (`list_files`)
  - Edit text files (`edit_file`)

## Prerequisites

- Ruby (recommended version 2.7+)
- Bundler
- Anthropic API key

## Installation

1. Clone this repository
2. Install dependencies:

```bash
bundle install
```

3. Set up your Anthropic API key:

```bash
export ANTHROPIC_API_KEY=your_api_key_here
```

## Usage

Start the agent by running:

```bash
ruby learny.rb
```

This will launch an interactive chat session where you can communicate with the AI agent.

Type `exit` to end the session.

## Examples

Here are some examples of commands you can use:

### List Files

```
> I need a list of all the files in this project
```

The agent will use the `list_files` tool to show you all files in the current directory and subdirectories.

### Read a File

```
> Show me the contents of Gemfile
```

The agent will use the `read_file` tool to display the contents of the specified file.

### Edit a File

```
> Edit the file example.txt and replace "Hello" with "Hello World"
```

The agent will use the `edit_file` tool to make the requested change. If the file doesn't exist, it will be created.

## Project Structure

- `learny.rb` - Main entry point
- `Gemfile` - Ruby dependencies
- `src/agent.rb` - Agent implementation
- `src/tools/` - Tool implementations:
  - `read_file.rb` - Tool to read file contents
  - `list_files.rb` - Tool to list files and directories
  - `edit_file.rb` - Tool to edit text files

## Dependencies

- [ruby_llm](https://github.com/ruby-llm/ruby-llm) - Ruby client for LLM APIs

## Environment Variables

- `ANTHROPIC_API_KEY` - Your Anthropic API key for accessing Claude models

## Troubleshooting

- If you encounter an authentication error, make sure your `ANTHROPIC_API_KEY` is set correctly
- Ensure all dependencies are installed with `bundle install`