
# Schema of DB in Mysql

### Tags

```
CREATE TABLE `project1`.`tags` (
  `tagid` INT NULL,
  `tagname` VARCHAR(45) NULL,
  `tagtype` VARCHAR(45) NULL,
  PRIMARY KEY (`tagid`),
  UNIQUE INDEX `tagtype_UNIQUE` (`tagtype` ASC));


```


### Playlists

```
CREATE TABLE `project1`.`new_table` (
  `name` VARCHAR(45) NOT NULL,
  `owner` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`, `owner`));
```

### Users

```
CREATE TABLE `project1`.`Users` (
  `uid` INT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC));

```

### Companies

```
CREATE TABLE `project1`.`Companies` (
  `cid` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cid`));


```
### Artists

```
CREATE TABLE `project1`.`Artists` (
  `aid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `style` VARCHAR(45) NULL,
  `image_url` TEXT,
  UNIQUE INDEX `image_url_UNIQUE` (`image_url` ASC));    
  ```
  
### Albums

```
CREATE TABLE `project1`.`Albums` (
  `alid` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `publish_date` DATETIME NULL,
  `image_url` TEXT NULL,
  PRIMARY KEY (`alid`));

```

### Songs
```
CREATE TABLE `project1`.`Songs` (
  `sid` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `resource_url` TEXT NULL,
  PRIMARY KEY (`sid`));
```

### LikedBy

```
CREATE TABLE `project1`.`LikedBy` (
  `uid` INT NULL,
  `sid` INT NULL,
  `like` INT NULL,
  PRIMARY KEY (`uid`, `sid`, `like`),
  INDEX `sid_idx` (`sid` ASC),
  CONSTRAINT `sid`
    FOREIGN KEY (`sid`)
    REFERENCES `project1`.`Songs` (`sid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `uid`
    FOREIGN KEY (`uid`)
    REFERENCES `project1`.`Users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

```