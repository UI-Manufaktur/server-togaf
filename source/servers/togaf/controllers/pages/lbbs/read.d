module servers.togaf.controllers.pages.lbbs.read;

@safe:
import servers.togaf;

class DTGFLbbReadPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFLbbReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFLbbReadView(this));
  }
}
mixin(MVCControllerCalls!("TGFLbbReadPageController", "DTGFLbbReadPageController"));
