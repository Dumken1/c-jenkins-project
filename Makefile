CC = gcc
CFLAGS = -Wall -Werror -g
SRC = src/main.c src/utils.c
OBJ = $(SRC:.c=.o)
TARGET = my_program
LIB = -lcunit

TEST_SRC = tests/test_main.c tests/test_utils.c
TEST_OBJ = $(TEST_SRC:.c=.o)
TEST_TARGET = test_runner

all: $(TARGET)
	@echo "[$$(date '+%Y-%m-%d %H:%M:%S')] Compiling Completed" | tee -a build.log

$(TARGET): $(OBJ)
	@echo "[$$(date '+%Y-%m-%d %H:%M:%S')] ====== Linking... $^ " | tee -a build.log
	@echo $(CC) $(CFLAGS) -o $(TARGET) $(OBJ) >> build.log
	@$(CC) $(CFLAGS) -o $(TARGET) $(OBJ) >> build.log 2>&1

%.o: %.c
	@echo "[$$(date '+%Y-%m-%d %H:%M:%S')] ====== Compiling... $< " | tee -a build.log
	@echo $(CC) $(CFLAGS) -c $< -o $@ >> build.log
	@$(CC) $(CFLAGS) -c $< -o $@ >> build.log 2>&1

clean:
	@rm -f $(OBJ) $(TARGET) $(TEST_TARGET) $(TEST_OBJ) >> build.log 2>&1
	@echo "[$$(date '+%Y-%m-%d %H:%M:%S')] Clean completed!" >> build.log

test: $(TEST_TARGET)
	@./$(TEST_TARGET) >> build.log 2>&1

$(TEST_TARGET): $(TEST_SRC) src/utils.c
	@echo $(CC) $(CFLAGS) -o $(TEST_TARGET) $(TEST_SRC) src/utils.c $(LIB) >> build.log
	@$(CC) $(CFLAGS) -o $(TEST_TARGET) $(TEST_SRC) src/utils.c $(LIB) >> build.log 2>&1