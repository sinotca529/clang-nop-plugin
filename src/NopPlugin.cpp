#include "clang/AST/ASTConsumer.h"
#include "clang/Frontend/FrontendAction.h"
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "clang/Frontend/PrecompiledPreamble.h"

namespace {

class NopAction : public clang::PluginASTAction {
protected:
  std::unique_ptr<clang::ASTConsumer>
  CreateASTConsumer(clang::CompilerInstance &CI, llvm::StringRef) override {
    llvm::errs() << "I am NopPlugin!\n";
    return std::make_unique<clang::ASTConsumer>();
  }

  bool ParseArgs(
    clang::CompilerInstance const &CI, std::vector<std::string> const &arg
  ) override {
    return true;
  }
};

} // namespace

static clang::FrontendPluginRegistry::Add<NopAction>
  X("nop-plugin", "an nop clang plugin");
