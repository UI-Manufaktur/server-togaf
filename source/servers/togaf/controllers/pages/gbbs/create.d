module servers.togaf.controllers.pages.gbbs.create;

@safe:
import servers.togaf;

class DTGFGbbCreatePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFGbbCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFGbbCreateView(this));
  }
}
mixin(MVCControllerCalls!("TGFGbbCreatePageController", "DTGFGbbCreatePageController"));
