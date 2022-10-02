module servers.togaf.controllers.pages.lbbs.update;

@safe:
import servers.togaf;

class DTGFLbbUpdatePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFLbbUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFLbbUpdateView(this));
  }
}
mixin(MVCControllerCalls!("TGFLbbUpdatePageController", "DTGFLbbUpdatePageController"));
