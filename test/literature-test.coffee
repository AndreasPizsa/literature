literature= require("../")
assert    = require("assert")

describe "literature", ->
  fs = require("fs")
  it "extracts unfenced code blocks, ignores everything else", ->
    expected = fs.readFileSync(__dirname + "/expected/unfenced-code.js", "utf-8")
    actual = literature(fs.readFileSync(__dirname + "/fixtures/unfenced-code.js.md", "utf-8"))
    assert.strictEqual actual, expected
    return

  return
