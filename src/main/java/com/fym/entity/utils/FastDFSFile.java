package com.fym.entity.utils;


public class FastDFSFile {
    private String file_id; //文件id
    private String group;   //远程组名
    private String remote_name;//远程文件名

    private byte[] content; //文件内容
    private String name;    //文件名称
    private String ext;     //扩展名
    private long length;    //文件大小
    private Object author;  //作者Id

    public FastDFSFile(){}

    public FastDFSFile(byte[] content,String ext) {
        this.content = content;
        this.ext = ext;
    }

    public FastDFSFile(byte[] content, String name, String ext) {
        this.content = content;
        this.name = name;
        this.ext = ext;
    }

    public FastDFSFile(byte[] content, String name, String ext, long length) {
        this.content = content;
        this.name = name;
        this.ext = ext;
        this.length = length;
    }

    public String getFile_id() {
        return file_id;
    }

    public void setFile_id(String file_id) {
        this.file_id = file_id;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getRemote_name() {
        return remote_name;
    }

    public void setRemote_name(String remote_name) {
        this.remote_name = remote_name;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public long getLength() {
        return length;
    }

    public void setLength(long length) {
        this.length = length;
    }

    public Object getAuthor() {
        return author;
    }

    public void setAuthor(Object author) {
        this.author = author;
    }
}
