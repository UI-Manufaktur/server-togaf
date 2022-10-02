module servers.togaf.controllers.pages.gbbs.index;

@safe:
import servers.togaf;

class DTGFGbbIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFGbbIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFGbbIndexView(this));
  }
}
mixin(MVCControllerCalls!("TGFGbbIndexPageController", "DTGFGbbIndexPageController"));
