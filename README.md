# MITRE ATT&CK goes to the mall (Trivia)

This is a trivia game web application that uses JavaScript, HTML, and a Node.js server to serve the game data. The trivia questions are based on MITRE ATT&CK techniques and presented through various scenarios.

## Features

- **Dynamic Question Loading**: Questions are stored as Markdown files in the `questions` directory and can have any filename.
- **Server-Side Processing**: A Node.js server processes the Markdown files and serves the questions as JSON.
- **Interactive Interface**: The webpage dynamically loads and displays the questions, allowing users to interactively select answers and view explanations.
- **Dark Mode Support**: Includes a dark mode toggle for better accessibility and user preference.
- **Modern Design**: Utilizes Material Design 3 for a sleek and modern user interface.

## Setup Instructions

### Prerequisites

- [Node.js](https://nodejs.org/en/download/) installed.
- A modern web browser (e.g., Chrome, Firefox, Edge).

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://your-repo-url.git
   cd trivia_game
   ```

2. **Install Node.js Dependencies**

   ```bash
   npm install
   ```

### Running the Application

1. **Start the Node.js Server**

   In a terminal window, navigate to the project directory and run:

   ```bash
   npm start
   ```

   This will start the server on `http://localhost:5001`.

2. **Start a Local Web Server for Static Files**

   In a new terminal window, navigate to the project directory and run:

   ```bash
   npm run start-web
   ```

   This will serve the static files on `http://localhost:8001`.

3. **Access the Trivia Game**

   Open your web browser and navigate to:

   ```
   http://localhost:8001
   ```

   The game should now be up and running.

## Adding Questions

- **Create New Markdown Files**: Add your question Markdown files to the `questions` directory. You can use any filenames (e.g., `my_question.md`).

- **Question Markdown Format**:

  ```markdown
  # Question Title

  **Scenario:**

  Your scenario description goes here.

  **Options:**

  - A) Option A description
  - B) Option B description
  - C) Option C description
  - D) Option D description

  **Answer:**

  A

  **Explanation:**

  Your explanation of why this is the correct answer.
  ```

  Ensure that you follow this format for the application to parse and display the questions correctly.

## Customization

- **Styling**: Modify the CSS in the `<style>` section of `index.html` to change the appearance of the game.

- **Functionality**: Update the JavaScript in `index.html` or the server-side Node.js code in `server.js` to add new features or modify existing ones.

## License

This project is open-source and available under the MIT License.

## Acknowledgments

- [Material Design Web Components](https://github.com/material-components/material-web) for UI components.
- [Express.js](https://expressjs.com/) for the server framework.
- [Marked.js](https://marked.js.org/) for Markdown parsing on the client side.