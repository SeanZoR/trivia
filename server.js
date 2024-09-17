const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const cors = require('cors');

app.use(cors());

// Function to process markdown files
function processMarkdownFile(filepath) {
    const content = fs.readFileSync(filepath, 'utf-8');
    const lines = content.split('\n');

    let questionData = {
        title: '',
        scenario: '',
        options: [],
        answer: '',
        explanation: ''
    };
    let currentSection = '';

    lines.forEach(line => {
        line = line.trim();

        // Check for section headers
        if (line.startsWith('# ')) {
            questionData.title = line.substring(2).trim();
        } else if (line.startsWith('**Scenario:**')) {
            currentSection = 'scenario';
        } else if (line.startsWith('**Options:**')) {
            currentSection = 'options';
        } else if (line.startsWith('**Answer:**')) {
            currentSection = 'answer';
        } else if (line.startsWith('**Explanation:**')) {
            currentSection = 'explanation';
        } else if (line.startsWith('**') && line.endsWith('**')) {
            // Skip other bold lines
            currentSection = '';
        } else {
            // Add content to the current section
            if (currentSection === 'scenario') {
                questionData.scenario += line + '\n';
            } else if (currentSection === 'options') {
                if (line.startsWith('-')) {
                    questionData.options.push(line.substring(1).trim());
                }
            } else if (currentSection === 'answer') {
                questionData.answer += line + '\n';
            } else if (currentSection === 'explanation') {
                questionData.explanation += line + '\n';
            }
        }
    });

    return questionData;
}

// Endpoint to list questions
app.get('/list_questions', (req, res) => {
    const questionsDir = path.join(__dirname, 'questions');
    fs.readdir(questionsDir, (err, files) => {
        if (err) {
            return res.status(500).json({ error: 'Failed to read questions directory.' });
        }

        const markdownFiles = files.filter(f => f.endsWith('.md'));
        const questions = markdownFiles.map(file => {
            const filepath = path.join(questionsDir, file);
            return processMarkdownFile(filepath);
        });

        res.json(questions);
    });
});

// Start the server
const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
