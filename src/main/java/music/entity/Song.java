package music.entity;

import java.util.Date;

public class Song {
    private String songId;
    private String songName;
    private String userid;
    private String language;
    private int playCount;
    private int downloadCount;
    private int collectionCount;
    private Date publishDate;
    private String songUrl;
    private String cyricUrl;
    private Double songTime;
    private String typeId;

    public String getSongId() {
        return songId;
    }

    public void setSongId(String songId) {
        this.songId = songId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getPlayCount() {
        return playCount;
    }

    public void setPlayCount(int playCount) {
        this.playCount = playCount;
    }

    public int getDownloadCount() {
        return downloadCount;
    }

    public void setDownloadCount(int downloadCount) {
        this.downloadCount = downloadCount;
    }

    public int getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(int collectionCount) {
        this.collectionCount = collectionCount;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getSongUrl() {
        return songUrl;
    }

    public void setSongUrl(String songUrl) {
        this.songUrl = songUrl;
    }

    public String getCyricUrl() {
        return cyricUrl;
    }

    public void setCyricUrl(String cyricUrl) {
        this.cyricUrl = cyricUrl;
    }

    public Double getSongTime() {
        return songTime;
    }

    public void setSongTime(Double songTime) {
        this.songTime = songTime;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }


}
