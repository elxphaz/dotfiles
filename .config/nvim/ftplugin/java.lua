local config = {
  name = "jdtls",
  cmd = {
    "jdtls",
    -- prevent .settings, .project, etc files from being generated at every folder on java project
    "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false",
    "-Xmx4G"
  },
  root_dir = vim.fs.root("gradlew", ".git", "mvnw"),
  settings = {
    java = {
    }
  }
}

require("jdtls").start_or_attach(config)
