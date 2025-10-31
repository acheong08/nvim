# Neovim 0.12 kickstart

With the release of Neovim 0.12, the configuration landscape has been significantly simplified. Gone is the dependency on external package managers and complicated LSP setup. My configuration has subsequently gone from ~1500 lines of Lua to just < 200 with all the same functionality I have come to rely on.

Organization:

```
> tree
.
├── init.lua        // Entry point. Imports other packages
├── lua
│   ├── ai.lua      // Copilot Chat configuration. Optional
│   ├── base.lua    // LSP, formatting, telescope, and mandatory shortcuts
│   └── colors.lua  // Theme
└── README.md
```

Cheers!
