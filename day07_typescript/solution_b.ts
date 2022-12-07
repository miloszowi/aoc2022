import * as fs from 'fs';


class UltimateAdventOfCodeSolver 
{
    private readonly AVAILABLE_SPACE: number = 70000000;
    private readonly DESIRED_UNUSED_SPACE: number = 30000000;

    public solve(lines: string[]): void
    {
        const rootDirectory: Directory = this.getRootDirectory(lines);
        const currentUnusedSpace = this.AVAILABLE_SPACE - rootDirectory.getSize();
        const sizesThatWouldAllowTheUpdate: number[] = [];

        for (var directorySize of rootDirectory.getDirectoriesSizes()) {
            if (currentUnusedSpace + directorySize >= this.DESIRED_UNUSED_SPACE) {
                sizesThatWouldAllowTheUpdate.push(directorySize);
            }
        }

        console.log(Math.min(...sizesThatWouldAllowTheUpdate));
    }

    private getRootDirectory(lines: string[]): Directory
    {
        const rootDirectory: Directory = new Directory('/');
        var cwd: Directory;

        lines.forEach(
            (line: string) => {
                if (undefined === cwd!) return cwd = rootDirectory;
                const lineSplited: string[] = line.split(' ');

                if (this.isCurrentDirectoryCommand(line)) {
                    const destination: string = lineSplited.pop() as string;
                
                    cwd = destination !== '..' ? cwd.getChildDirectoryByName(destination) : cwd.parent as Directory; 
                } 
                
                if (this.isDirectory(line)) {
                    cwd.directories.push(
                        new Directory(
                            lineSplited.pop() as string,
                            cwd
                        )
                    );
                } 

                if (this.isFile(line)) {
                    cwd.fileSizes.push(
                        Number(lineSplited[0])
                    )
                }
            }
        );

        return rootDirectory;
    }

    private isCurrentDirectoryCommand(line: string): boolean
    {
        return line.includes('$ cd');
    }

    private isDirectory(line: string): boolean
    {
        return line.includes('dir');
    }

    private isFile(line: string): boolean
    {
        return /\d/.test(line);
    }
}

class Directory
{
    constructor(
        public readonly name: string,
        public readonly parent: Directory|null = null,
        public directories: Directory[] = [],
        public fileSizes: number[] = []
    ) {}

    public getSize(): number
    {
        var size: number = 0;

        this.fileSizes.map(
            (fileSize: number) => size += fileSize
        )
        this.directories.map(
            (directory: Directory) => size += directory.getSize()
        );

        return size;
    }

    public getChildDirectoryByName(name: string): Directory 
    {
        return this.directories.find(
            (directory: Directory) => directory.name === name
        ) as Directory;
    }

    public getDirectoriesSizes(): number[]
    {
        var sizes: number[] = [];

        for (var directory of this.directories) {
            sizes.push(...directory.getDirectoriesSizes())
        }

        sizes.push(this.getSize());

        return sizes;
    }
}

const instance = new UltimateAdventOfCodeSolver;

const inputArray: string[] = fs.readFileSync('./input.txt').toString().split("\n");
instance.solve(inputArray);