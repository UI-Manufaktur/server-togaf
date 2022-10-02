module servers.togaf.controllers.pages.index;

@safe:
import servers.togaf;

class DTGFIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        TGFIndexView(this));
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DTGFIndexPageController~":DTGFIndexPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }

  override void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DTGFIndexPageController~":DTGFIndexPageController::afterResponse");
    super.afterResponse(options);
    // if (this.session) this.session.save;
  }
}
mixin(MVCControllerCalls!("TGFIndexPageController", "DTGFIndexPageController"));