
exports.activate = function() {
}

exports.deactivate = function() {
}
class IssueProvider {
    constructor() {
    }
    provideIssues(editor) {
        let process = new Process("/Users/liamoc/.opam/default/bin/forester",{
            args:["build"],
            cwd:nova.workspace.path,
            stdio:['ignore','pipe','pipe']
        });
        var items = [];
        var errorstate = 0;
        var error= null;
        var errorfile = null;
        var errorline = null;
        var errormsg = null;
        process.onStdout(function(line) {
            if (errorstate == 0) {
                if (line.match(/￫ error/)) {
                    errorstate = 1;
                    error = new Issue();
                    error.code = line;
                    error.severity = IssueSeverity.Error
                }
            }
            else if (errorstate == 1) {
                errorfile = line.split("￭")[1].trim();
                errorstate = 2;
            }
            else if (errorstate == 2) {
                error.line = line.split("|")[0].trim()+ 0;
                errorstate = 3;
            }
            else if (errorstate == 3) {
                var arr = line.split("^");
                arr.shift();
                error.message = arr.join("^");
                error.column = 0;
                items.push(error);
                errorstate = 0;
            }
        })
        process.start()
        return new Promise((resolve) => {
            process.onDidExit(function () { resolve(items) })
        })
    }

}
class CompletionProvider {
    constructor() {    
    }
    provideCompletionItems(editor, context) {
        let text = context.text;
        let items = [];
        var path = nova.config.get("forester.forester-path");
        if (path == null) { 
            console.error("Please set up the path to forester in your global extension settings")
            path = "forester" 
        };
        
        let process = new Process(path,{
            args:["complete"],
            cwd:nova.workspace.path,
            stdio:['ignore','pipe','pipe']
        });
        process.onStdout(function(line) {
            let arrs = line.split(",");
            let key = arrs.shift();
            let rest = arrs.join(",");
            let item = new CompletionItem(rest,CompletionItemKind.File);
            item.insertText = key; 
            item.detail = key; 
            item.insertTextFormat = InsertTextFormat.Snippet;
            items.push(item);
        })
        process.start()
        return new Promise((resolve) => {
            process.onDidExit(function (status) { 
                if (status != 0) { resolve([]) } else { resolve(items) }})
        })
    }
}
nova.assistants.registerCompletionAssistant("forester", new CompletionProvider(), {
    triggerChars: new Charset("(")
});
nova.assistants.registerIssueAssistant("forester",new IssueProvider(), {event:"onSave"})
