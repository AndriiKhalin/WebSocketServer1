namespace WebSocketServer.Models
{
    public class DirectoryInfoViewModel
    {
        public string Path { get; set; }
        public List<string> Directories { get; set; }
        public List<string> Files { get; set; }

        public DirectoryInfoViewModel()
        {

            Path = Directory.GetCurrentDirectory();
            Directories = Directory.GetDirectories(Path).ToList();
            Files = Directory.GetFiles(Path).ToList();
        }

        public DirectoryInfoViewModel(string path)
        {
            Path = path;
            Directories = Directory.GetDirectories(path).ToList();
            Files = Directory.GetFiles(path).ToList();
        }

        public int CountDirectories()
        {
            return Directories.Count;
        }

        public int CountFiles()
        {
            return Files.Count;
        }
    }
}
