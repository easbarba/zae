package pak

import (
	"os"
	"path/filepath"
	"testing"
)

func TestConfigFolder(t *testing.T) {
	home, _ := os.UserHomeDir()
	configFolder := filepath.Join(home, ".config", "pak")

	t.Run("check configuration folder location", func(t *testing.T) {
		got := ConfigFolder()
		want := configFolder

		if got != want {
			t.Errorf("got %q want %q", got, want)
		}
	})

	// TODO: if XDG_CONFIG_HOME is set to another location, point there instead.
}
