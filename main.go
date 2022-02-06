package main

import (
	"github.com/alecthomas/kong"
)

func main() {
	ctx := kong.Parse(&Cli,
		kong.Name("distro"),
		kong.Description("system packages management made easy."),
		kong.UsageOnError(),
		kong.ConfigureHelp(kong.HelpOptions{
			Compact: true,
			Summary: true,
		}))

	// just do it!
	Run(ctx.Command())
}
