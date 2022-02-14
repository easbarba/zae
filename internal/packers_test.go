package pak

import (
	"testing"
)

func TestConfigFolder(t *testing.T) {
	t.Run("check configuration folder location", func(t *testing.T) {
		got := ConfigFolder()
		want := homeConfigFolder

		if got != want {
			t.Errorf("got %q want %q", got, want)
		}
	})
}
