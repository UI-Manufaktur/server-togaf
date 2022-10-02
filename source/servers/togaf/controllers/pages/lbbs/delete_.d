module servers.togaf.controllers.pages.lbbs.delete_;

@safe:
import servers.togaf;

class DTGFLbbDeletePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFLbbDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFLbbDeleteView(this));
  }
}
mixin(MVCControllerCalls!("TGFLbbDeletePageController", "DTGFLbbDeletePageController"));
