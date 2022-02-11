package distro

import (
	"os"
	"path/filepath"
)

func ConfigFolder() string {
	home, err := os.UserHomeDir()

	if err != nil {
		panic(err)
	}

	config := filepath.Join(home, ".config", "distro")
	_, err = os.Stat(config)

	if os.IsNotExist(err) {
		panic(err)
	}

	return config
}
