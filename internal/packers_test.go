package distro

import (
	"os"
	"path/filepath"
	"testing"
)

func TestConfigFolder(t *testing.T) {
	home, _ := os.UserHomeDir()

	got := ConfigFolder()
	want := filepath.Join(home, ".config", "distro")

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
