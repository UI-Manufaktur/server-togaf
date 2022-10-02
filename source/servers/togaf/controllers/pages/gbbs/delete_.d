module servers.togaf.controllers.pages.gbbs.delete_;

@safe:
import servers.togaf;

class DTGFGbbDeletePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFGbbDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFGbbDeleteView(this));
  }
}
mixin(MVCControllerCalls!("TGFGbbDeletePageController", "DTGFGbbDeletePageController"));
