package pak

import (
	"os"
	"path/filepath"
)

var (
	folderName       = "pak"
	home, err        = os.UserHomeDir()
	homeConfigFolder = filepath.Join(home, ".config", folderName)
)

// TODO: if XDG_CONFIG_HOME is set to another location, point there instead.

func ConfigFolder() string {
	var result string

	if err != nil {
		panic(err)
	}

	XDGFolder := os.Getenv("XDG_CONFIG_HOME")
	XDGConfigFolder := filepath.Join(XDGFolder, folderName)

	if XDGConfigPresent() {
		result = XDGConfigFolder
	} else {
		result = homeConfigFolder
	}

	return result
}

func XDGConfigPresent() bool {
	_, present := os.LookupEnv("XDG_CONFIG_HOME")

	return present
}

// _, err = os.Stat(config)

// 	if os.IsNotExist(err) {
// 		panic(err)
// 	}
