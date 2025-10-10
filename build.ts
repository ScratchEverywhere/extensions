#!/usr/bin/env bun

import { $, Glob } from "bun";
import { dirname, join } from "path";
import { mkdir } from "fs/promises";
import { ScratchEverywhereCustomExtensionMetadata } from "./schema";

const glob = new Glob("**/*");

const potentialFolders = new Set<string>();

for await (const path of glob.scan(".")) {
  if (path.includes("node_modules") || !path.includes("/")) continue;
  potentialFolders.add(dirname(path));
}

if (potentialFolders.size > 0) {
  await mkdir(join(import.meta.dir, "bin"), { recursive: true });
}

for (const folder of potentialFolders) {
  const metaFile = Bun.file(join(folder, "meta.json"));
  if (
    !(await Bun.file(join(folder, "main.lua")).exists()) ||
    !(await metaFile.exists())
  ) continue;

  const meta: ScratchEverywhereCustomExtensionMetadata = await metaFile.json();

  await $`seec -o ${join(import.meta.dir, "bin", meta.id + ".see")}`.cwd(
    folder,
  );
}
