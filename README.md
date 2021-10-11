# latex-docker
## Usage (CLI)

This command: 
- runs the container (`docker run`),
- called `project-name` (`--name "project-name"`)
- removes the container's file system after it exits (`--rm`)
- allocates an interactive (pseudo) tty (`-it`)
- mounts the current directory to the container under `/mnt` (`-v ($pwd):/mnt`)

```bash 
docker run --rm --name "project-name" -it -v $(pwd):/mnt pblan/latex
``` 

Then you can just use:
```bash
latexmk -pdf
```
... to run LaTeX on all `.tex` files in the current directory.

```bash
latexmk -pdf myfile.tex
```
... to run LaTeX on the specified `myfile.tex` file

## Usage (Visual Studio Code)
For a more detailed description, see https://code.visualstudio.com/docs/remote/containers

*Requirements*
- VS Code Extension Pack: [Remote Development (Microsoft)](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

*Quick Start*
1. Start VS Code.
2. Run the `Remote-Containers: Open Folder in Container...` command from the Command Palette (`F1`).
3. Select the project folder.
4. Select a starting point (`Dockerfile`) for the dev container.
    - If the `Dockerfile` exists in the project folder, choose `Existing Dockerfile`.
5. VS Code will reload and connect to the container.

*Notes*
- This repo includes the `.devcontainer/devcontainer.json` file which defines common build recipes to use with the also specified [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.

### Manual

This command mounts the folders `~/GitHub/fha-sto`, `~/GitHub/fha-swt` and `~/GitHub/fha-db` to the container:
```bash
docker run --rm --name "latex" -itd --restart always -v ~/GitHub/fha-sto:/mnt/fha-sto -v ~/GitHub/fha-swt:/mnt/fha-swt -v ~/GitHub/fha-db:/mnt/fha-db latex
``` 

You can then just select the container `latex` within VS Code, add the respective `/mnt` (or single `/mnt/fha-*` folders) to the workspace.

## Notes
`texlive-full` is about 3.3GB in size, so building the image might take some time.