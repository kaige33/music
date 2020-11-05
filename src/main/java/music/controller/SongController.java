package music.controller;

import music.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("song")
public class SongController {
    @Autowired
    private SongService songService;
    @RequestMapping("list")
    public String list(Map map){
      map.put("song",songService.list());
      return "newTrackOnShelfFrame";

    }

}
