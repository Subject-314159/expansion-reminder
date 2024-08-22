# Expansion & FFF reminder

Feeling lonely? Here's a companion mod that reminds you that the expansion is close but at the same time so far away

![reminder](https://raw.githubusercontent.com/Subject-314159/expansion-reminder/main/assets/reminder-screenshot.png)

![reminder-detailed](https://raw.githubusercontent.com/Subject-314159/expansion-reminder/main/assets/detailed-reminder.png)

Compatible with [Thought bubbles](https://mods.factorio.com/mod/thought-bubbles)

---

# Remote interface

You can now retrieve random FFFs via the remote interface. Simply require this mod in your info.json!

Remote interface available to retrieve random FFF: `local fact = remote.call("friday-facts", "get-random-fact")`

Return structure:

```lua
local fact = {
    date = "Mmm DD YYYY",
    fff = "FFF #123",
    title = "Blog post title",
    detail = { -- Optional, data.detail not always present
        name = "Name",
        summary = "Short description",
        description = "What it is" -- Optional, data.detail.description not always present
    }
}
```

---

# Roadmap

-   Implement check for base version and installed mods
-   Add separate remarks for when Factorio 2'ish is installed
-   Update locale for after the release date
