package distro

import (
	"os"
	"path/filepath"
)

func ConfigFolder() string {
	home, err := os.UserHomeDir()
	result := ""
	folderName := "distro"

	if err != nil {
		panic(err)
	}

	homeConfigFolder := filepath.Join(home, ".config", folderName)

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
