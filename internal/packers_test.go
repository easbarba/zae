package distro

import (
	"testing"
)

func TestConfigFolder(t *testing.T) {
	got := ConfigFolder()
	want := "/home/easbarba/.config/distro"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
