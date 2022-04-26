PATH_TOOLS_JDK=C:/openjdk/bin

DIR=build
OUT=out.jar

# Точка вхождения исполняемого файла: имя класса
POINT_OUT=CMain

all: dir compile link_exe execute
#all: dir compile link_lib

dir: clean
	if not exist $(DIR) mkdir $(DIR)

compile:
	$(PATH_TOOLS_JDK)/javac -d $(DIR) CMain.java
	$(PATH_TOOLS_JDK)/javac -d $(DIR) CSum.java
	
link_lib:
	$(PATH_TOOLS_JDK)/jar cf $(DIR)/$(OUT) -C $(DIR) CMain.class -C $(DIR) CSum.class 
	
link_exe:
	$(PATH_TOOLS_JDK)/jar cfe $(DIR)/$(OUT) $(POINT_OUT) -C $(DIR) CMain.class -C $(DIR) CSum.class 
	
execute:
	$(PATH_TOOLS_JDK)/java -jar $(DIR)/$(OUT)
	
clean:
	if exist $(DIR) rmdir /s /q $(DIR)
	