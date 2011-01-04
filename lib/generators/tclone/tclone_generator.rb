class TcloneGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_template_files
    clone_generator_templates( name )
  end

  private
  def clone_generator_templates( gname, goptions = [] )
    klass_obj = Rails::Generators.find_by_namespace( gname, *goptions )
    if( klass_obj )
      clone_templates( klass_obj.namespace, klass_obj.source_root )
      for k,v in klass_obj.hooks 
        gk = klass_obj.class_options[k].default
        gk = ( gk == true ) ? k : gk
        clone_generator_templates( gk, v )
      end
    end
  end

  def clone_templates( ns, path )
    if( path and File.directory? path )
      directory path, "lib/templates/#{ns.gsub(/:/,'/')}"
    end
  end

end
