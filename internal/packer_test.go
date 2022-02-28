package pak

import (
	"testing"
)

func TestFound(t *testing.T) {
	got := Action("install")
	want := "install"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
