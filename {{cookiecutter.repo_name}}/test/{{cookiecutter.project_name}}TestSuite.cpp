#include <gtest/gtest.h>

namespace test {

class {{cookiecutter.project_name | capitalize}}TestSuite : public ::testing::Test
{
public:
    ~{{cookiecutter.project_name}}TestSuite() = default;
};

TEST({{cookiecutter.project_name | capitalize}}TestSuite, Contrived)
{
    EXPECT_TRUE(true);
}
}
