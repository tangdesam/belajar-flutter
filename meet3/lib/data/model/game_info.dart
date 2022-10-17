class GameInfo {
  String name;
  String publisher;
  String genre;
  String releaseDate;
  String banner;
  // String description;
  List<String> imageUrls;

  GameInfo(
      {required this.name,
        required this.publisher,
        required this.genre,
        required this.releaseDate,
        required this.banner,
        required this.imageUrls});

}

var gameInfoList = [

  GameInfo(
      name: 'StarCraft',
      publisher: 'Blizzard',
      genre: 'RTS',
      releaseDate: '31-Mar-1998',
      banner: 'images/starcraft.jpg',
      imageUrls: [
        'https://cdn.vox-cdn.com/thumbor/EBt6HUM8C3Ro4mTRFXR76EI47e4=/0x0:1920x1080/1200x800/filters:focal(252x242:558x548)/cdn.vox-cdn.com/uploads/chorus_image/image/55523673/Game2_Space_ProtossRush_SpectatorPerspective_01.0.jpg',
        'https://www.gamespot.com/a/uploads/original/123/1239113/3105107-184087-starcraft.png',
        'https://assets.reedpopcdn.com/starcraft-remastered-out-this-summer-1490599238622.jpg/BROK/thumbnail/1600x900/format/jpg/quality/80/starcraft-remastered-out-this-summer-1490599238622.jpg'
      ]
  ),

  GameInfo(
      name: 'Counter Strike',
      publisher: 'Valve',
      genre: 'FPS',
      releaseDate: '31-Mar-1998',
      banner: 'images/cs.jpg',
      imageUrls: [
        'https://asset.kompas.com/crops/rAmucUL2dFFSuxcVh6TdVK9PvCg=/0x85:1024x768/750x500/data/photo/2020/06/16/5ee833feae561.jpg',
        'https://www.gamespot.com/a/uploads/original/123/1239113/3105107-184087-starcraft.png',
        'https://assets.reedpopcdn.com/starcraft-remastered-out-this-summer-1490599238622.jpg/BROK/thumbnail/1600x900/format/jpg/quality/80/starcraft-remastered-out-this-summer-1490599238622.jpg'
      ]
  ),

  GameInfo(
      name: 'CnC Generals',
      publisher: 'EA',
      genre: 'RTS',
      releaseDate: '10-Feb-2003',
      banner: 'images/generals.jpg',
      imageUrls: [
        'https://gamingnewsanalyst.com/wp-content/uploads/2020/08/command-and-conquer-generals-download-696x471-1.png',
        'https://www.gamespot.com/a/uploads/original/123/1239113/3105107-184087-starcraft.png',
        'https://assets.reedpopcdn.com/starcraft-remastered-out-this-summer-1490599238622.jpg/BROK/thumbnail/1600x900/format/jpg/quality/80/starcraft-remastered-out-this-summer-1490599238622.jpg'
      ]
  ),

];