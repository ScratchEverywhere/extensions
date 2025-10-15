(function (Scratch) {
  class FilesDummy implements Scratch.Extension {
    getInfo(): Scratch.Info {
      return {
        id: "localfiles",
        name: "Local Files",
        blocks: [
          {
            opcode: "read",
            blockType: Scratch.BlockType.REPORTER,
            text: "Read from [PATH]",
            arguments: {
              PATH: {
                type: Scratch.ArgumentType.STRING,
              },
            },
          },
          {
            opcode: "write",
            blockType: Scratch.BlockType.COMMAND,
            text: "Write [CONTENT] to [PATH]",
            arguments: {
              CONTENT: {
                type: Scratch.ArgumentType.STRING,
              },
              PATH: {
                type: Scratch.ArgumentType.STRING,
              },
            },
          },
          {
            opcode: "append",
            blockType: Scratch.BlockType.COMMAND,
            text: "Append [CONTENT] to [PATH]",
            arguments: {
              CONTENT: {
                type: Scratch.ArgumentType.STRING,
              },
              PATH: {
                type: Scratch.ArgumentType.STRING,
              },
            },
          },
          {
            opcode: "mkdir",
            blockType: Scratch.BlockType.COMMAND,
            text: "Make directory [PATH]",
            arguments: {
              PATH: {
                type: Scratch.ArgumentType.STRING,
              },
            },
          },
          {
            opcode: "ls",
            blockType: Scratch.BlockType.COMMAND,
            text: "Load files in directory [PATH] into list [LIST]",
            arguments: {
              PATH: {
                type: Scratch.ArgumentType.STRING,
              },
              LIST: {
                type: Scratch.ArgumentType.STRING,
                menu: "lists",
              },
            },
          },
        ],
        menus: {
          lists: {
            acceptReporters: true,
            items: "getLists",
          },
        },
      };
    }

    read() {
      return "";
    }

    write() {}

    append() {}

    mkdir() {}

    ls() {}

    getLists() {
      const globalLists = Object.values(
        vm.runtime.getTargetForStage().variables,
      ).filter((x) => x.type === "list");
      const localLists = vm.editingTarget
        ? Object.values(vm.editingTarget.variables).filter(
          (x) => x.type === "list",
        )
        : [];
      const uniqueLists = [...new Set([...globalLists, ...localLists])];
      if (uniqueLists.length === 0) {
        return [
          {
            text: Scratch.translate("select a list"),
            value: "select a list",
          },
        ];
      }
      return uniqueLists.map((i) => ({
        text: i.name,
        value: i.id,
      }));
    }
  }

  Scratch.extensions.register(new FilesDummy());
})(Scratch);
