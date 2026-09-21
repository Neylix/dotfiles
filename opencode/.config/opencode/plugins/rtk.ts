import type { Plugin } from "@opencode/plugin"
import { execFile } from "node:child_process"
import { promisify } from "node:util"

const exec = promisify(execFile)

// `rtk rewrite` prints the rewritten command on stdout but may exit non-zero,
// so read stdout from both the success and failure paths (V1 used `nothrow()`).
async function rewrite(command: string): Promise<string | undefined> {
  try {
    const { stdout } = await exec("rtk", ["rewrite", command])
    return stdout
  } catch (error) {
    const stdout = (error as { stdout?: string | Buffer }).stdout
    return stdout === undefined ? undefined : String(stdout)
  }
}

// RTK OpenCode plugin — rewrites commands to use rtk for token savings.
// Requires: rtk >= 0.23.0 in PATH.
//
// This is a thin delegating plugin: all rewrite logic lives in `rtk rewrite`,
// which is the single source of truth (src/discover/registry.rs).
// To add or change rewrite rules, edit the Rust registry — not this file.
//
// The V2 definition is a plain object so the plugin has no runtime dependency
// on @opencode/plugin, which is imported for types only.

export default {
  id: "rtk",
  async setup(ctx) {
    try {
      await exec("which", ["rtk"])
    } catch {
      console.warn("[rtk] rtk binary not found in PATH — plugin disabled")
      return
    }

    await ctx.tool.hook("execute.before", async (event) => {
      const tool = String(event.tool ?? "").toLowerCase()
      if (tool !== "bash" && tool !== "shell") return
      if (!event.input || typeof event.input !== "object") return
      const args = event.input as Record<string, unknown>

      const command = args.command
      if (typeof command !== "string" || !command) return

      const rewritten = (await rewrite(command))?.trim()
      if (rewritten && rewritten !== command) {
        args.command = rewritten
      }
    })
  },
} satisfies Plugin.Plugin
