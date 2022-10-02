module servers.togaf.controllers.pages.gbbs.update;

@safe:
import servers.togaf;

class DTGFGbbUpdatePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFGbbUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFGbbUpdateView(this));
  }
}
mixin(MVCControllerCalls!("TGFGbbUpdatePageController", "DTGFGbbUpdatePageController"));
