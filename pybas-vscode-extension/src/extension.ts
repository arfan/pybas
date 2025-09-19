import * as vscode from 'vscode';
import * as path from 'path';
import { exec } from 'child_process';

export function activate(context: vscode.ExtensionContext) {
    console.log('PyBAS extension is now active!');

    // Register commands
    let runCommand = vscode.commands.registerCommand('pybas.run', () => {
        runPyBASProgram();
    });

    let formatCommand = vscode.commands.registerCommand('pybas.format', () => {
        formatPyBASCode();
    });

    let replCommand = vscode.commands.registerCommand('pybas.repl', () => {
        openPyBASREPL();
    });

    context.subscriptions.push(runCommand, formatCommand, replCommand);
}

function runPyBASProgram() {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
        vscode.window.showErrorMessage('No active PyBAS file');
        return;
    }

    const document = editor.document;
    if (document.languageId !== 'pybas') {
        vscode.window.showErrorMessage('Current file is not a PyBAS file');
        return;
    }

    // Save the file first
    document.save().then(() => {
        const filePath = document.fileName;
        const workspaceFolder = vscode.workspace.getWorkspaceFolder(document.uri);
        const pybasPath = workspaceFolder ? 
            path.join(workspaceFolder.uri.fsPath, 'pybas') : 
            'pybas';

        // Create terminal and run the program
        const terminal = vscode.window.createTerminal('PyBAS');
        terminal.show();
        terminal.sendText(`python3 "${pybasPath}" "${filePath}"`);
    });
}

function formatPyBASCode() {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
        vscode.window.showErrorMessage('No active PyBAS file');
        return;
    }

    const document = editor.document;
    if (document.languageId !== 'pybas') {
        vscode.window.showErrorMessage('Current file is not a PyBAS file');
        return;
    }

    // Save the file first
    document.save().then(() => {
        const filePath = document.fileName;
        const workspaceFolder = vscode.workspace.getWorkspaceFolder(document.uri);
        const formatterPath = workspaceFolder ? 
            path.join(workspaceFolder.uri.fsPath, 'pybasfmt') : 
            'pybasfmt';

        exec(`python3 "${formatterPath}" "${filePath}"`, (error, stdout, stderr) => {
            if (error) {
                vscode.window.showErrorMessage(`Format error: ${error.message}`);
                return;
            }
            if (stderr) {
                vscode.window.showWarningMessage(`Format warning: ${stderr}`);
            }
            
            // Reload the file to show formatted content
            vscode.commands.executeCommand('workbench.action.files.revert');
            vscode.window.showInformationMessage('PyBAS code formatted successfully!');
        });
    });
}

function openPyBASREPL() {
    const workspaceFolder = vscode.workspace.workspaceFolders?.[0];
    const replPath = workspaceFolder ? 
        path.join(workspaceFolder.uri.fsPath, 'pybasrepl') : 
        'pybasrepl';

    const terminal = vscode.window.createTerminal('PyBAS REPL');
    terminal.show();
    terminal.sendText(`python3 "${replPath}"`);
}

export function deactivate() {}