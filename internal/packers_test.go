package distro

import (
	"os"
	"path/filepath"
	"testing"
)

func TestConfigFolder(t *testing.T) {
	home, _ := os.UserHomeDir()

	configFolder := filepath.Join(home, ".config", "distro")
	// TODO: if XDG_CONFIG_HOME is set to another location, point there instead.

	got := ConfigFolder()
	want := configFolder

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
