module servers.togaf.controllers.actions.abbs.create;

@safe:
import servers.togaf;

class DTGFAbbCreateActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFAbbCreateActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFAbbCreateActionController", "DTGFAbbCreateActionController"));
