package music.service.impl;

import music.entity.Song;
import music.mapper.SongMapper;
import music.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class SongServiceimpl implements SongService {
    @Autowired
    private SongMapper songMapper;
    @Override
    public List<Song> list() {
        return songMapper.list();
    }
}
