package music.mapper;

import music.entity.Song;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongMapper {
    @Select("select * from song ")
    List<Song> list();
}
