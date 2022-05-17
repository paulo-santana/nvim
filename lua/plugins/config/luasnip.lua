local ok, luasnip = pcall(require, "luasnip")

if not ok then
    return
end

luasnip.config.set_config {
    -- history = true,
    updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").lazy_load()

-- my snippets

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("make", {
    s("make", {
        t({        "NAME := "}), i(1),
        t({"", "", "SRC := "}), i(0),
        t({"", "", "OBJ_DIR := ./obj"}),
        t({"", "", "OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:.cpp=.o))"}),
        t({"", "", "DEPS := $(addprefix $(OBJ_DIR)/, $(SRC:.cpp=.d))"}),
        t({    "", "CXXFLAGS := -Wall -Werror -Wextra -std=c++98 -MMD -MP"}),
        t({    "", "CXX := c++"}),
        t({    "", "RM := rm -rf"}),
        t({"", "", "all: $(NAME)", }),

        t({"", "", "$(NAME): $(OBJ_DIR) $(OBJ)",
                   "	$(CXX) $(OBJ) -o $(NAME)", }),
        t({"", "", "clean:",
                   "	$(RM) $(OBJ_DIR)"}),
        t({"", "", "fclean: clean",
                   "	$(RM) $(NAME)"}),
        t({"" ,"", "re: fclean all", }),
        t({"", "", "$(OBJ_DIR):",
                   "	mkdir -p $(OBJ_DIR)"}),
        t({"", "", "$(OBJ_DIR)/%.o: %.cpp",
                   "	$(CXX) $(CXXFLAGS) -o $@ -c $<"}),
        t({"" ,"", "-include $(DEPS)", }),
    })
})
