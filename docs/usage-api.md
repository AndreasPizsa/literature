# API

```javascript
literature = require('literature');
console.log(literature('test.js.md'));
```

## Example
### Input
 `test.js.md`

```markdown
# Usage
Literature extracts (unfenced) code blocks - such as the following - from Markdown files:

    literature = require('literature');
    console.log(literature('test.js.md'));

Sending this file through Literature will output only the above two code lines.
```

### Output
`test.js`
```javascript
literature = require('literature');
console.log(literature('test.js.md'));
```
