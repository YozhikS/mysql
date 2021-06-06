
ALTER TABLE vk.likes 
ADD CONSTRAINT likes_fk_2
FOREIGN KEY (media_id) REFERENCES vk.media(id);


ALTER TABLE vk.profiles 
ADD CONSTRAINT profiles_fk 
FOREIGN KEY (photo_id) REFERENCES vk.photos(id);