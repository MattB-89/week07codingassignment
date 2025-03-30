DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS category;

CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name varchar(128),
	PRIMARY KEY (category_id)
);

CREATE TABLE project(
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name varchar(128) NOT NULL,
	estimated_hours decimal(7,2),
	actual_hours decimal(7,2),
	difficulty INT,
	notes text,
	PRIMARY KEY (project_id)
);

CREATE TABLE project_category(
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text text NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY  (step_id)
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name varchar(128) NOT NULL,
	num_required INT,
	cost decimal (7,2),
	PRIMARY KEY (material_id)
	FOREIGN KEY (project_id)
);
