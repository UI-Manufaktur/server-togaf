module servers.togaf.controllers.pages.gbbs.read;

@safe:
import servers.togaf;

class DTGFGbbReadPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFGbbReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFGbbReadView(this));
  }
}
mixin(MVCControllerCalls!("TGFGbbReadPageController", "DTGFGbbReadPageController"));
