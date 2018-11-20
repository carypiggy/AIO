package com.mpri.aio.file.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.mpri.aio.file.model.File;

public interface FileRepository extends MongoRepository<File, String>{

}
